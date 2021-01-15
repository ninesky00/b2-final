class SurgeryDoctorsController < ApplicationController
  def create
    surgery = Surgery.find(params[:surgery_id])
    doctor = Doctor.find_by(name: params[:doctor])
    SurgeryDoctor.create(surgery: surgery, doctor: doctor)
    redirect_to surgery_path(params[:surgery_id])
  end
end