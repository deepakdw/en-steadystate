/*******************************************************//**
@class      searchQueryRecordWrapper
@brief      Inner wrapper class of searchQueryWrapper to parse MDM response into a single unit, holds
            nested records under root structure. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.
***********************************************************/

public class MDM_SearchQueryRecordWrapper extends MDM_BaseWrapper{    
    
    public String siperianObjectUid {get; set;}
    public List<MDM_SearchQueryFieldWrapper> field {get; set;}
    
    public MDM_SearchQueryRecordWrapper(){      
    }

    public override void setField(String field, Object value) {
        switch on field.toLowerCase(){
            when 'siperianObjectUid' { this.siperianObjectUid = getStringValue(value); }            
        }
    }

    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'siperianObjectUid' { return this.siperianObjectUid;}          
            when else {return null;}
        }
    }

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