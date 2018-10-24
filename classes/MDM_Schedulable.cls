/*******************************************************//**
@class      MDM_Schedulable 
@brief      MDM_Schedulable class invoke by MDM_queuable class to trigger the MDM 360 integration process with SFDC.           
@author     Deepak Dwivedi
@bug        No known defects.
@todo       None.
***********************************************************/
global class MDM_Schedulable implements Schedulable{

    global void execute(SchedulableContext sc){    
        System.enqueueJob(new MDM_Queuable());
    }
}