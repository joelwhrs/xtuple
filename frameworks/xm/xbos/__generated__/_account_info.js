// ==========================================================================
// Project:   xTuple Postbooks - Business Management System Framework        
// Copyright: ©2012 OpenMFG LLC, d/b/a xTuple                             
// ==========================================================================

/*globals XM */

/**
  @scope XM.AccountInfo
  @class

  This code is automatically generated and will be over-written. Do not edit directly.

  @extends XM.Record
*/
XM._AccountInfo = XM.Record.extend(
  /** @scope XM.AccountInfo.prototype */ {
  
  className: 'XM.AccountInfo',

  

  // .................................................
  // PRIVILEGES
  //

  privileges: {
    "all": {
      "create": false,
      "read": true,
      "update": false,
      "delete": false
    }
  },

  //..................................................
  // ATTRIBUTES
  //
  
  /**
    @type Number
  */
  guid: SC.Record.attr(Number),

  /**
    @type Number
  */
  number: SC.Record.attr(Number),

  /**
    @type Number
  */
  name: SC.Record.attr(Number),

  /**
    @type Boolean
  */
  isActive: SC.Record.attr(Boolean)

});
