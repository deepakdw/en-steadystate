/*******************************************************//**
@class      MDM_Schedulable 
@purpose    MDM_Schedulable class invoke by MDM_queuable class to trigger the MDM 360 integration process with SFDC.           
@author     Deepak Dwivedi
@date       8/18/2018 3:02 AM
@invokedby  None.
***********************************************************/
global class MDM_Schedulable implements Schedulable{

    global void execute(SchedulableContext sc){    
        System.enqueueJob(new MDM_Queuable());
    }
}