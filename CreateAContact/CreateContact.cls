public class CreateContact {

    public Contact con {get;set;}
    private ApexPages.StandardController stdCon;
    
    public CreateContact(ApexPages.StandardController sc) {
        this.con = (Contact)sc.getRecord();
        con.AccountId = ApexPages.currentPage().getParameters().get('accountId');
        this.stdCon = sc;
    }

    public PageReference saveCon(){
        stdCon.save();
        Contact newCon = (Contact)stdCon.getRecord();
        PageReference pgRef = Page.DisplayContact;
        pgRef.getParameters().put('id', newCon.Id);
        pgRef.setRedirect(true);
        return pgRef;
    }
}
