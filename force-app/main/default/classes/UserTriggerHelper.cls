/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-05-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class UserTriggerHelper {
    @future
    public static void assignPermissionSetToLProfileUsers(Set<Id> userIds)
    {
        System.debug('inside future');
        Permissionset perset = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Marketing_User_Permissions' LIMIT 1];
        List<PermissionSetAssignment>  Npermission = new List<PermissionSetAssignment>();
        for(Id userId : userIds)
        {
            PermissionSetAssignment LPermissionSetAssignment = new PermissionSetAssignment();
            LPermissionSetAssignment.PermissionSetId = perset.Id;
            LPermissionSetAssignment.AssigneeId = userId;
            Npermission.add(LPermissionSetAssignment);
        }
        
        if(Npermission != null)
        {
            insert Npermission;
        }
    }


    
}
