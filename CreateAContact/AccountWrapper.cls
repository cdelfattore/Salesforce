public class AccountWrapper {

    public Boolean isSelected {get;set;}
    public Account acc {get;set;}
    
    public AccountWrapper(Account a){
        this.acc = a;
    }    
}
