const cds = require("@sap/cds");
module.exports = cds.service.impl(function () {
<<<<<<< HEAD
  const { BusinessPartner, State, Product } = this.entities();
=======
  const { BusinessPartner, State, Product, PurchaseApp } = this.entities();
>>>>>>> f5a5c0461b3424e5d8e7ee392983cf481b3b0124
  this.on("READ", State, async (req) => {
    states = [
      { code: "TS", description: "Telangana" },
      { code: "AP", description: "AndhraPradesh" },
      { code: "TN", description: "TamilNadu" },
      { code: "DE", description: "Delhi" },
<<<<<<< HEAD
=======
      { code: "MP", description: "MadhyaPradesh" },
>>>>>>> f5a5c0461b3424e5d8e7ee392983cf481b3b0124
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

<<<<<<< HEAD
  this.before(["CREATE", "UPDATE"], BusinessPartner, async (req) => {
    // if (gst !== gst_no) {
=======
  this.before(["CREATE"], BusinessPartner, async (req) => {
    // let state = req.data.state;
    // let panno = req.data.pan_no;
    // gstno = req.data.gst_no;
    // gstno = gstno.substring(0, 14);
    // gst_number = state + panno + "Z";

    // if (gstno !== gst_number) {
>>>>>>> f5a5c0461b3424e5d8e7ee392983cf481b3b0124
    //   req.error({
    //     code: "INVALID_GST_NUMBER",
    //     message: "Invalid GST Number",
    //     target: "gst_no",
    //   });
    // }
<<<<<<< HEAD
    const is_gstn_registered = req.data.is_gstn_registered;
    if (!is_gstn_registered) {
      req.error({
        code: "INVALID_GST_NO",
        message: "Enter gst registered number",
        target: "is_gstn_registered",
      });
    }
=======
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
>>>>>>> f5a5c0461b3424e5d8e7ee392983cf481b3b0124
  });
});
