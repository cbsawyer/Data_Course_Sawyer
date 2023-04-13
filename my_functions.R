r_med_sq_err <- function(model, absolute=FALSE){
  if(sum(class(model)%in%c("glm",'lm'))>0){
    if(absolute==TRUE){
      median(abs(residuals(model)^2))
    }
    sqrt(median(residuals(model)^2))
  } else {
    stop("'model' must be either a glm or lm object.")
  }
}
