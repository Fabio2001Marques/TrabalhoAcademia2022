/**
 * @description       : 
 * @author            : Fábio Marques
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Fábio Marques
**/
@isTest
public class TestWarSupTrigger {
    @TestSetup
    static void makeData(){
        TestDataFactory.createWarSup(10);
    }

    @isTest
    static void warSupTriggerTest(){

        Warship__c warship = [Select id From Warship__c Limit 1];

        List<Warship_Supply__c> warSup = [Select id,Name, Supply_Name__c, Quantity__c From Warship_Supply__c Where Ship_supply__c = :warship.Id];

        System.debug('1: '+warSup);
        for (Warship_Supply__c ws : warSup) {
            
            System.assert(ws.Quantity__c > 0, 'Quantity must be greater than 0.');
        }

    }
}