describe("jungle-rails app", () => {
  it("should go to a products page when cliecked", () => {
    cy.visit("/");

    //click on first product
    cy.get(".products article").first().find("a").click();

    //check if the url changed to the product's
    cy.url().should("include", "/products");
    cy.get(".product-detail").should("be.visible");
  });
});
