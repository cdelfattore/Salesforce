public class AccountWrapper {

    public Boolean isChecked {get;set;}
    public Account acc {get;set;}
    
    public AccountWrapper(Account a){
        this.acc = a;
    }    
}