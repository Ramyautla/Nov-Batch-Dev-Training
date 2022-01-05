/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-05-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger UserTrigger on SOBJECT (before insert,before update,before delete,after insert,after update,after delete)
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        System.debug('Inside after insert');
        Set<Id> userIds = new Set<Id>();
        Profile LProfile = [SELECT Id,Name FROM Profile WHERE Name = 'Custom: Marketing Profile' LIMIT 1];
       
        for(User Nuser : Trigger.new)
        {
            if(Nuser.ProfileId == LProfile.Id)
            {
                userIds.add(Nuser.Id);
            }
        }
        
        UserTriggerHelper.assignPermissionSetToLProfileUsers(userIds);
    }
}