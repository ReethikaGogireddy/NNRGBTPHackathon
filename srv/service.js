const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
  const { BusinessPartner, State, Product } = this.entities();
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

  this.before(["CREATE"], Product, async (req) => {
    const product_cp = calcAge(req.data.product_cp);
    const product_sp = calcAge(req.data.product_sp);
    if (product_sp < product_cp) {
      req.error({
        code: "INVALID_SELLING_COST",
        message: "Selling price should not be less than Cost Price",
        target: "product_sp",
      });
    }
  });

  this.before(["CREATE", "UPDATE"], BusinessPartner, async (req) => {
    // if (gst !== gst_no) {
    //   req.error({
    //     code: "INVALID_GST_NUMBER",
    //     message: "Invalid GST Number",
    //     target: "gst_no",
    //   });
    // }
    const is_gstn_registered = req.data.is_gstn_registered;
    if (!is_gstn_registered) {
      req.error({
        code: "INVALID_GST_NO",
        message: "Enter gst registered number",
        target: "is_gstn_registered",
      });
    }
  });
});
