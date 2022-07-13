/**
 * @description       : 
 * @author            : Fábio Marques
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Fábio Marques
**/
@isTest
public class TestSupplyTrigger {
    @TestSetup
    static void makeData(){
        TestDataFactory.insertSupplies(10);
    }

    @isTest
    static void suppliesTest() {      

        List<Supply__c> s = [Select Id, Name, Quantity__c From Supply__c];
        
        for (Supply__c supply : s) {
            for (Supply__c supplies : s) {
                if(supplies.Id != supply.Id){
                    System.assert(supplies.Name != supply.Name, 'Supply Name: '+supplies.Name+ '////'+ supply.Name);                  
                }
            }                        
        }

    }
}