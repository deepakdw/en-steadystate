/*******************************************************//**
@class      searchQueryFieldWrapper
@purpose    Inner wrapper class of searchQueryRecordWrapper to parse MDM response into a single unit, holds
            nested fields under list of searchQueryRecordWrapper. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@date       8/9/2018 3:17 AM
@invokedby  MDM_SiperianService, MDM_AccountsHelper.
***********************************************************/

public with sharing class MDM_SearchQueryFieldWrapper extends MDM_BaseWrapper{
    
    public String name;
    public String stringValue;
    public String dateValue;
    
    public MDM_SearchQueryFieldWrapper(){        
    }
    
	/********************************
    Purpose:     to set the field value
    Parameters:  field and value of object type
    Return:      void
    ********************************/
    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'name' { this.name = getStringValue(value);}
            when 'stringValue' { this.stringValue = getStringValue(value); }
            when 'dateValue' { this.dateValue = getStringValue(value); }            
        }
    }
    
	/********************************
    Purpose:     to get the field
    Parameters:  field of string type
    Return:      void
    ********************************/
    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'name' { return this.name;}
            when 'stringValue' { return this.stringValue;}
            when 'dateValue' { return this.dateValue;}            
            when else { return null;}
        }
    }
    
	/********************************
    Purpose:     to deep clone the nested response
    Parameters:  none
    Return:      void
    ********************************/
    public override Object deepClone(){             
        MDM_SearchQueryFieldWrapper result = this.clone();        
        return result;
    }
}