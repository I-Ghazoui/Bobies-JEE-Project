<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered m-5" style="max-width: 100%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Product section-->
          <section>
              <div class="container px-lg-5">
                  <div class="row gx-4 gx-lg-5 align-items-center">
                      <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                      <div class="col-md-6">
                          <div class="small mb-1">SKU: BST-498</div>
                          <h1 class="display-5 fw-bolder">Shop item template</h1>
                          <div class="fs-5 mb-5">
                              <span class="text-decoration-line-through">$45.00</span>
                              <span>$40.00</span>
                          </div>
                          <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                          <div class="d-flex">
                              <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                              <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                  <i class="bi-cart-fill me-1"></i>
                                  Add to cart
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
          </section>
        <!-- END Product section-->
      </div>
    </div>
  </div>
</div>
<!-- END Modal -->