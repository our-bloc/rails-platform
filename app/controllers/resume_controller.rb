require 'pdfkit'
require 'after_the_deadline'
require 'gingerice'
AfterTheDeadline(nil, nil) # no custom dictionary, accept all error types

class ResumeController < ApplicationController
    respond_to :html, :json
    before_action :create_experience , only: [:build]
    
      # GET /resumes/1
  # GET /resumes/1.json
  def show
    @user = current_user

  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end
  
  def export 
   resume = Resume.find(params[:resume_id])
    PDFKit.new("#{request.referer}", :page_size => 'A3').to_file("#{resume.name}.pdf")
    respond_to do |format|
      format.html
      format.pdf{
        render pdf: resume.id
      }
    end
  end 

  def build
    @resume = Resume.find_by_user_id([current_user.id])
    
    if @resume.experiences[0] == nil
                
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Academic", 
                                    :position               => params[:school],
                                    :title           => params[:degree] +" in " + params[:major],
                                    :detail2            => params[:gpa],
                                    :dates               => params[:school_dates]

        
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work"       
         
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                   => "Work" 
                  
                  Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                 => "Work" 
                                    
    end
    
    
        @academic_experience = Experience.where(detail1: 'Academic', resume_id: @resume.id)[0]
        

        @work_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[0]
        @work2_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[1]
        @work3_experience = Experience.where(detail1: 'Work', resume_id: @resume.id)[2]
        
        if @leadership_experience == nil 
          Experience.create :user_id              => current_user.id, 
                                    :resume_id              => @resume.id,
                                    :detail1                 => "Leadership"
          
          @leadership_experience = Experience.where(detail1: 'Leadership', resume_id: @resume.id)[0]

                          
        else
          @leadership_experience = Experience.where(detail1: 'Leadership', resume_id: @resume.id)[0]
        end 
        
        

  end 
  # POST /resumes
  # POST /resumes.json
  def create
    @resume = current_user.resumes.build(resume_params)
    @resume.user_id = current_user.id
    @resume.name = current_user.name
    @resume.email = current_user.email 

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    @resume = Resume.find(params[:id])
    @resume.update_attributes(resume_params)
    
    @academic_experience = Experience.where(detail1: 'Academic', resume_id: @resume.id)[0]
    @academic_title_error= AfterTheDeadline.check @academic_experience.title
    @academic_position_error= AfterTheDeadline.check @academic_experience.position
    
      respond_with @resume , @academic_title_error , @academic_position_error
    
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to resume common setup or constraints between actions.
    def set_resume
      @resume = resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name, :email, :address, :languageskills, :computerskills, :phone)
    end
    
    def experience_params
      params.require(:experience).permit(:dates, :type, :detail1, :detail2, :detail3, :title, :position,
      :location, :detail4, :resume_id , :user_id)
    end
    
    def create_experience
        @resume = Resume.find_by_user_id([current_user.id])
        if Experience.where(detail1: 'Academic', resume_id: @resume.id)[0] == nil
        @academic_experience = 
          Experience.create :user_id              => current_user.id, 
                            :resume_id              => @resume.id,
                            :detail1                   => "Academic"
        elsif Experience.where(detail1: 'Work', resume_id: @resume.id)[0] == nil
         @work_experience = 
          Experience.create :user_id              => current_user.id, 
                            :resume_id              => @resume.id,
                            :detail1                   => "Work"       
 
         elsif Experience.where(detail1: 'Work', resume_id: @resume.id)[1] == nil
          @work_experience2 = 
          Experience.create :user_id              => current_user.id, 
                            :resume_id              => @resume.id,
                            :detail1                   => "Work" 
          
          elsif Experience.where(detail1: 'Work', resume_id: @resume.id)[2] == nil
          @work_experience3 = 
          Experience.create :user_id              => current_user.id, 
                            :resume_id              => @resume.id,
                            :detail1                 => "Work" 
                            
          elsif Experience.where(detail1: 'Leadership', resume_id: @resume.id)[0] == nil
          @work_experience3 = 
          Experience.create :user_id              => current_user.id, 
                            :resume_id              => @resume.id,
                            :detail1                 => "Leadership" 
                        
      end
end
    
end 