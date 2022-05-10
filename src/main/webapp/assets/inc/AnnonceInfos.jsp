<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal${annonce.id}" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered"
		style="max-width: fit-content;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pb-5">
				<!-- Product section-->
				<section>
					<div class="container">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<div class="col-md-6">
								<img class="card-img-top mb-5 mb-md-0"
									src="assets/uploadedFiles/animals/${annonce.animal.image}"
									alt="..." />
							</div>
							<div class="col-md-6">
								<h1 class="display-5 fw-bolder">${annonce.nom}</h1>
								<div class="lead mb-2"><span style="font-weight: bold;">Nom d'animal: </span>${annonce.animal.nom}</div>
								<c:if test="not empty annonce.prix">
									<div class="fs-5 mb-5">
										<span>
											${annonce.prix}
										</span>
									</div>
								</c:if>
								<p class="lead" style="text-align: justify;"><span style="font-weight: bold;">Description: </span>${annonce.description}</p>
								<!-- 
								<div class="d-flex">
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" value="1" style="max-width: 3rem" />
									<button class="btn btn-outline-dark flex-shrink-0"
										type="button">
										<i class="bi-cart-fill me-1"></i> Add to cart
									</button>
								</div>
								-->
								
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