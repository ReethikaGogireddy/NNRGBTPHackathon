const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
    const { BusinessPartner, States} = this.entities();
 
     
    this.on("READ", State, async (req) => {
        states = [
          { code: "TS", description: "Telangana" },
          { code: "AP", description: "AndhraPradesh" },
          { code: "TN", description: "TamilNadu" },
          { code: "DE", description: "Delhi" },
        ];
        states.$count = states.length;
        return states;
      });

});