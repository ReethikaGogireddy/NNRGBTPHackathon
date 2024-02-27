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
    const gst = req.data.gst_no;
    const is_gstn_registered = req.data.is_gstn_registered;
    if (is_gstn_registered == true && gst == null) {
      req.error({
        code: "INVALID_GST_NO",
        message: "Enter gst registered number please",
        target: "is_gstn_registered",
      });
    }
    const results = await cds
      .transaction(req)
      .run(SELECT.from(BusinessPartner));
    const count = results.length;

    req.data.business_partnerno = count + 1;
  });
});
