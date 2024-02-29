const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
  const { BusinessPartner, State, Product, PurchaseApp } = this.entities();
  this.on("READ", State, async (req) => {
    states = [
      { code: "TS", description: "Telangana" },
      { code: "AP", description: "AndhraPradesh" },
      { code: "TN", description: "TamilNadu" },
      { code: "DE", description: "Delhi" },
      { code: "MP", description: "MadhyaPradesh" },
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

  this.before(["CREATE"], BusinessPartner, async (req) => {
    // let state = req.data.state;
    // let panno = req.data.pan_no;
    // gstno = req.data.gst_no;
    // gstno = gstno.substring(0, 14);
    // gst_number = state + panno + "Z";

    // if (gstno !== gst_number) {
    //   req.error({
    //     code: "INVALID_GST_NUMBER",
    //     message: "Invalid GST Number",
    //     target: "gst_no",
    //   });
    // }
    // console.log(gstno);
    // console.log(gst_number);
    const gst = req.data.gst_no;
    const is_gstn_registered = req.data.is_gstn_registered;
    if (is_gstn_registered == true && gst == null) {
      req.error({
        code: "INVALID_EMPTY_FIELD",
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

  this.before(["CREATE"], [PurchaseApp, Product], async (req) => {
    const Itemsdata = req.data.Items.price;
    console.log(Itemsdata);
  });
});
