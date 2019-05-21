public class AccountListWithCheckBoxes {

    public Contact con;
    public AccountListWithCheckBoxes(ApexPages.StandardController sc) {
        this.con = (Contact)sc.getRecord();
    }

    public List<AccountWrapper> getAccounts(){
        List<AccountWrapper> accWrapList = new List<AccountWrapper>();
        List<Account> accList = [select Id, Name, BillingPostalCode FROM Account WHERE Name != 'sForce'];

        if(!accList.isEmpty()){
            for(Account a : accList){
                accWrapList.add(new AccountWrapper(a));
            }                
        }
       
        return accWrapList;
    }
}