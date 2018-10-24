@isTest
public class MDM_QueuableandSchedulableTest{

    @isTest static void testQueueable() {
    Test.startTest();
        Test.setMock(WebServiceMock.class, new MDM_MockQueuableCallout());
        MDM_Queuable queue = new MDM_Queuable();
        
        system.enqueueJob(queue);
    Test.stopTest();
    }
    
    @isTest static void  testschedule() {
        Test.startTest();
            Test.setMock(WebServiceMock.class, new MDM_MockQueuableCallout());
            MDM_Schedulable sch = new MDM_Schedulable();      
             String cron = '0 0 23 * * ?';
            system.schedule('Test run', cron, sch);
        Test.stopTest();
    }
}