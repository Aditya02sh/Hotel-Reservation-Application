import {api } from 'lwc';
import CqGridForm from 'c/cqGridForm';
import CQ_AS_SQX_STUDENT__C from '@salesforce/schema/CQ_AS_SQX_Student__c';


import FIELDS_PARENT_ID from '@salesforce/schema/CQ_AS_SQX_Teacher__c.Id';

import FIELDS_PARENT_NAME from '@salesforce/schema/CQ_AS_SQX_Teacher__c.Name';

import FIELDS_PARENT_CQ_AS_COURSE_STATUS__C from '@salesforce/schema/CQ_AS_SQX_Teacher__c.CQ_AS_Course_Status__c';





//import fields


import FIELDS_CQ_AS_SQX_STUDENT__C_NAME from '@salesforce/schema/CQ_AS_SQX_Student__c.Name';

import FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_GRADE__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Grade__c';

import FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_STATUS__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_Status__c';

import FIELDS_CQ_AS_SQX_STUDENT__C_CREATEDDATE from '@salesforce/schema/CQ_AS_SQX_Student__c.CreatedDate';

import FIELDS_CQ_AS_SQX_STUDENT__C_LASTMODIFIEDDATE from '@salesforce/schema/CQ_AS_SQX_Student__c.LastModifiedDate';

import FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_SQX_TEACHER_LOOKUP__C from '@salesforce/schema/CQ_AS_SQX_Student__c.CQ_AS_SQX_Teacher_Lookup__c';


//import customlabels (Labels must not have space)

import CQAS_NEW from '@salesforce/label/c.CQAS_NEW';

import CQAS_EDIT_MULTIPLE from '@salesforce/label/c.CQAS_EDIT_MULTIPLE';




            
import CQAS_TEACHERS_INFO from '@salesforce/label/c.CQAS_TEACHERS_INFO';
            

//additonalFields added in query while fetching data
const additionalFields = [



];
const columns = [


    FIELDS_CQ_AS_SQX_STUDENT__C_NAME,

        
    FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_GRADE__C,

        
    FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_STATUS__C,

        
               
              {
                
                    label: CQAS_TEACHERS_INFO,
                
                
                    type:'customComponent',
                
                

                    fields:[
                    
                    
                        {
                            fieldInfo:FIELDS_CQ_AS_SQX_STUDENT__C_CREATEDDATE
                            
                            
                            
                        },
                        
                        {
                            fieldInfo:FIELDS_CQ_AS_SQX_STUDENT__C_LASTMODIFIEDDATE
                            
                            
                            
                        },
                        
                    ],
                

                
                    groupName:'teachersInfoGroup'
                

               },
          
    
];

const parentFields = [

    FIELDS_PARENT_ID,

    FIELDS_PARENT_NAME,

    FIELDS_PARENT_CQ_AS_COURSE_STATUS__C,

];

export default class cquiASAsStudentGrid  extends CqGridForm {
    @api
    maxRows;

    @api
    maxColumns;

    @api
    gridType;

    @api
    flexipageRegionWidth;
    
    constructor() {
        super();
        this.fields = columns;
        this.columns = columns;
        this.mainObject = CQ_AS_SQX_STUDENT__C;
        this.relationalField = FIELDS_CQ_AS_SQX_STUDENT__C_CQ_AS_SQX_TEACHER_LOOKUP__C; //todo use this in import
        this.additionalFields = additionalFields;
        this.parentFields = parentFields;

        
        this.headerActions = [{"label": CQAS_NEW,"name":"std_new","componentName":"cqui-a-s-as-student-both"},{"label": CQAS_EDIT_MULTIPLE,"name":"showEditSelected","componentName":"cqui-a-s-as-student-both","component_namespace":"c-","action_type":"","bulk":true},];
        

        this.limitToRecordType = '';

        
        this.rowActions = [];
        

        
        this.rowFormRules = {"edit":{"fields":["CQ_AS_Course_Status__c","CQ_AS_Course_Status__c"],"visible":"parent.CQ_AS_Course_Status__c.value == 'Draft'   || parent.CQ_AS_Course_Status__c.value == 'In Progress'  "},"delete":{"fields":["CQ_AS_Course_Status__c","CQ_AS_Course_Status__c"],"visible":"parent.CQ_AS_Course_Status__c.value == 'Draft'   || parent.CQ_AS_Course_Status__c.value == 'In Progress'  "}};
        

        
        this.headerFormRules = {"std_new":{"fields":["CQ_AS_Course_Status__c","CQ_AS_Course_Status__c"],"visible":"parent.CQ_AS_Course_Status__c.value == 'Draft'   || parent.CQ_AS_Course_Status__c.value == 'In Progress'  "},"showEditSelected":{"fields":["CQ_AS_Course_Status__c","CQ_AS_Course_Status__c"],"visible":"parent.CQ_AS_Course_Status__c.value == 'Draft'   || parent.CQ_AS_Course_Status__c.value == 'In Progress'  "}};
        

        
        
    
               
                   

             
        

        
        this.sortOrder = 'ASC NULLS LAST';
        

        

        

        

        

        this.componentName="c:cquiASAsStudentGrid";

    }

    connectedCallback(){
        this.maxRowsToDisplay = this.maxRows;
        this.maxColumnsToDisplay = this.maxColumns;
        this.gridDesktopView = this.gridType;
    }

    @api 
    get recordId() {
        return this._recordId;
    }

    set recordId(value) {
        this._recordId = value;
    }

}