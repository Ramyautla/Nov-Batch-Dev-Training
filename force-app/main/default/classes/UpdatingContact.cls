/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-05-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class UpdatingContact {
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
       
        String query = 'SELECT Id,Account.Name, Title, Account.Description,Description FROM Contact';
        return Database.getQueryLocator(query);
        
    }

    public void execute(Database.BatchableContext bc, List<Contact> contacts)
    {
		if (contacts != null)        
        {
            for(Contact cont : contacts)
            {
                if (cont.Account.Name != null)
                {
                cont.Description = cont.Title +' ' + 'of' + ' ' + cont.Account.Name + ' ' + ':' + ' ' + cont.Account.Description;
                }
            }
            
            update contacts;
        }
    }
    public void finish(Database.BatchableContext bc)
    {
		// Sending success or failure emails to admins        
    }


}
