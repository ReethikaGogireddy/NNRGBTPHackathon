const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
    const { BusinessPartner, State} = this.entities();
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
    
      this.before(["CREATE", "UPDATE"], BusinessPartner, async (req) => {
        let state = req.data.state;
        let panno = req.data.pan_no;
        let gst_no = req.data.gst_no.substring(0, 14);
        let gst = state + panno + 'Z';
        
        if (gst !== gst_no) {
          req.error({
            code: "INVALID_GST_NUMBER",
            message: "Invalid GST Number",
            target: "gst_no",
          });
        }
      });
        
      
      this.before(["CREATE", "UPDATE"], BusinessPartner, async (req) => {
        results = await cds.run(req.query);
        business_partnerno=req.data.business_partnerno;
        if (Array.isArray(results)) {
          results.forEach((element) => {
            element.business_partnerno++;
          });
        } else {
           results.business_partnerno=business_partnerno++;
        }

      });

});

