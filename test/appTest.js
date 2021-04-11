const chai = require('chai');
const chaiHttp = require('chai-http');

const { expect } = chai;

chai.use(chaiHttp);

describe('Path Test', () => {
  it("Should GET /locations", (done) => {
    chai.request("localhost:3000")
      .get('/locations')
      .end((err, res) => {
        if (err) done(err);
        expect(res).to.have.status(200);
        expect(res).to.been.json;
        expect(err).to.be.null;
        done();
      });
  });

  it("Should GET /locations/:id", (done) => {
    chai.request("localhost:3000")
      .get('/locations/1')
      .end((err, res) => {
        expect(res).to.have.status(200);
        expect(res).to.been.json;
        expect(err).to.be.null;
        done();
      });
  });

  it("Should NOT GET /locations/:id outside of id range", (done) => {
    chai.request("localhost:3000")
      .get('/locations/5')
      .end((err, res) => {
        expect(res).to.have.status(404);
        expect(res).to.been.html;
        expect(res).to.have.header('content-length', 21);
        done();
      });
  });
});