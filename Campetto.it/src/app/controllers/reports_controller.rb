class ReportsController < ApplicationController

    def index
      @reports = Report.where(status: :pending)
    end

    def user_index
      @reports = Report.where(reporter: current_user)
      render 'index' 
    end

    def create
      @reportable = find_reportable(params[:report][:reportable_type], params[:report][:reportable_id])

      @report = Report.new(report_params)
      @report.status = :pending 

      if @reportable.present? && @report.save
        redirect_to bookings_path, notice: 'Segnalazione inviata con successo.'
      else
        Rails.logger.error(@report.errors.full_messages.join(", "))
        redirect_to bookings_path, notice: 'Errore invio segnalazione.'
      end
    end
    
    def accept
        @report = Report.find(params[:id])
        @report.update(status: :accepted)
        UserMailer.with(report: @report).notification.deliver_now
        respond_to do |format|
          format.html { redirect_back(fallback_location: reports_path, notice: 'Segnalazione accettata e notifica inviata.') }
          format.js 
        end
    end
      
    def reject
        @report = Report.find(params[:id])
        @report.update(status: :rejected)
        UserMailer.with(report: @report).notification.deliver_now
        respond_to do |format|
          format.html { redirect_back(fallback_location: reports_path, notice: 'Segnalazione rifiutata e notifica inviata.') }
          format.js 
        end
    end

    private
  
    def find_reportable(reportable_type, reportable_id)
      case reportable_type
      when 'Booking'
        Booking.find_by(id: reportable_id)
      when 'Review'
        Review.find_by(id: reportable_id)
      else
        nil
      end
    end
    
    def report_params
      params.require(:report).permit(:details, :reportable_type, :reportable_id, :reporter_type, :reporter_id)
    end
  end
  
  