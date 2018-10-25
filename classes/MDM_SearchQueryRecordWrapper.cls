/*******************************************************//**
@class      searchQueryRecordWrapper
@purpose    Inner wrapper class of searchQueryWrapper to parse MDM response into a single unit, holds
            nested records under root structure. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@date       8/9/2018 3:18 AM
@invokedby  MDM_SiperianService, MDM_AccountsHelper
***********************************************************/

public class MDM_SearchQueryRecordWrapper extends MDM_BaseWrapper{    
    
    public String siperianObjectUid {get; set;}
    public List<MDM_SearchQueryFieldWrapper> field {get; set;}
    
    public MDM_SearchQueryRecordWrapper(){      
    }
    
	/********************************
    Purpose:     to set the field value
    Parameters:  field and value of object type
    Return:      void
    ********************************/
    public override void setField(String field, Object value) {
        switch on field.toLowerCase(){
            when 'siperianObjectUid' { this.siperianObjectUid = getStringValue(value); }            
        }
    }
    
	/********************************
    Purpose:     to get the field
    Parameters:  field of string type
    Return:      void
    ********************************/
    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'siperianObjectUid' { return this.siperianObjectUid;}          
            when else {return null;}
        }
    }
    
	/********************************
    Purpose:     to deep clone the nested response
    Parameters:  none
    Return:      void
    ********************************/
    public override Object deepClone(){
        
        MDM_SearchQueryRecordWrapper result = this.clone();
        if(this.field != null) {
            result.field = new List<MDM_SearchQueryFieldWrapper>();
            for(MDM_SearchQueryFieldWrapper f : this.field){
                result.field.add((MDM_SearchQueryFieldWrapper)f.deepClone());
            }
        }        
        return result;
    }
}