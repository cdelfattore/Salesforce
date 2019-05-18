public class AccountContact {
    public List<Account> accounts {
        get {
            if(accounts == null){
                return [select Id, Name, (select Id, Name, Account.Name, Title, Phone, Email from Contacts) FROM Account WHERE Name != 'sForce'];
            }
            else {
                return accounts;
            }
        }
        set {
            accounts = value;
        }
    }
    
    public AccountContact(){

    }
}
