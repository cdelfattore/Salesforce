public class AccountListWithCheckBoxes {

    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null){
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, BillingPostalCode FROM Account WHERE Name != 'sForce']));
                setCon.setPageSize(5);
            }
            return setCon;
        }
        set;
    }

    public List<AccountWrapper> accounts {
        get {
            if(accounts == null){
                accounts = new List<AccountWrapper>();
            }
            return accounts;
        }
        
        set;
    }
    
    public boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
    
    public boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    
    public Id selectedId {get;set;}
        
    public AccountListWithCheckBoxes() {
        wrapAccounts();
    }
    
    public void previous(){
        setCon.previous();
        wrapAccounts();
    }
    
    public void next(){
        setCon.next();
        wrapAccounts();
    }
    
    public void wrapAccounts(){
        List<Account> accList = setCon.getRecords();
        accounts.clear();
        
        if(!accList.isEmpty()){
            for(Account a : accList){
                accounts.add(new AccountWrapper(a));
            }                
        } 
    }
    
    public PageReference createContact(){
        for(AccountWrapper aw : accounts){
            if(aw.isSelected){
                selectedId = aw.acc.Id;
            }
        }
        
        PageReference pr = Page.CreateContact;
        pr.getParameters().put('accountid', selectedId);
        pr.setRedirect(true);
        return pr;
    }
}
