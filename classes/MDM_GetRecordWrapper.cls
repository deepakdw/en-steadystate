/*******************************************************//**
@class      MDM_GetRecordWrapper
@purpose    Wrapper class to parse MDM get call response into a single unit. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@date       8/19/2018 11:59 PM
@invokedby  MDM_SiperianService, MDM_AccountsHelper.
***********************************************************/

public class MDM_GetRecordWrapper extends MDM_BaseWrapper{    
    
    public List<MDM_GetFieldWrapper> field {get; set;}
    
    public MDM_GetRecordWrapper(){      
    }
    
	/********************************
    Purpose:     to set the field value
    Parameters:  field and value of object type
    Return:      void
    ********************************/
    public override void setField(String field, Object value) {
        switch on field.toLowerCase(){
            when 'recordKey' {}            
        }
    }
    
	/********************************
    Purpose:     to get the field
    Parameters:  field of string type
    Return:      void
    ********************************/
    public override Object getField(String field){
        switch on field.toLowerCase(){                   
            when else {return null;}
        }
    }
    
	/********************************
    Purpose:     to deep clone the nested response
    Parameters:  none
    Return:      void
    ********************************/
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