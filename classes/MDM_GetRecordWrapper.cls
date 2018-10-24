/*******************************************************//**
@class      MDM_GetRecordWrapper
@brief      Wrapper class to parse MDM get call response into a single unit. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.
***********************************************************/

public class MDM_GetRecordWrapper extends MDM_BaseWrapper{    
    
    public List<MDM_GetFieldWrapper> field {get; set;}
    
    public MDM_GetRecordWrapper(){      
    }

    public override void setField(String field, Object value) {
        switch on field.toLowerCase(){
            when 'recordKey' {}            
        }
    }

    public override Object getField(String field){
        switch on field.toLowerCase(){                   
            when else {return null;}
        }
    }

    public override Object deepClone(){
        
        MDM_GetRecordWrapper result = this.clone();
        if(this.field != null) {
            result.field = new List<MDM_GetFieldWrapper>();
            for(MDM_GetFieldWrapper f : this.field){
                result.field.add((MDM_GetFieldWrapper)f.deepClone());
            }
        }        
        return result;
    }
}