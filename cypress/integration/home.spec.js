describe("jungle-rails app", () => {
  it("displays home page", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
});
