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
        let gst_no = req.data.gst_no.substring(0, 15);
        let gst = state + panno + 'Z';
        if(gst==!gst_no)
        {
          req.error({
            code: "DUPLICATE_COURSE",
            message: "Invalid GST Number",
            target: "code",
          });
        }
      });
    


});

