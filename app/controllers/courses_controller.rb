class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :subcribe_course, :unsubcribe_course]
  before_action :authenticate_user!, except: :show

  # GET /courses
  # GET /courses.json
  def index
    if current_user.student?
      @courses = current_user.course
    elsif current_user.teacher?
      @courses = current_user.courses
    elsif current_user.admin?
      @courses = Course.all
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    authorize @course, :show?
  end

  # GET /courses/new
  def new
    @course = Course.new()
    authorize @course, :create?
    @users = User.where(role: 'teacher')
    if !@users.exists?
      redirect_to(root_path) 
    end
  end

  # GET /courses/1/edit
  def edit
    authorize @course, :update?
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    if !course_params[:user_id]
      @course.user_id = current_user.id
    end
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    authorize @course
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    authorize @course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def subcribe_course
    @course = Course.find(@course.id)
    @subcribe = SubcribeCourse.new(user_id: current_user.id, course_id: @course.id)
    authorize @subcribe, :create?, policy_class: SubcribeCoursePolicy
    if SubcribeCourse.where(user_id: current_user.id, course_id: @course.id).exists? 
      flash[:notice] = "You already subcribe this course"
    else 
      if @subcribe.save
        flash[:notice] = "Subcribe this course successfully"
      else 
        flash[:notice] = "Something went wrong!!! Try later"
      end
    end
    redirect_to action: "index"
  end

  def unsubcribe_course
    subcribe = SubcribeCourse.where(user_id: current_user.id, course_id: @course.id).first
    authorize subcribe, :destroy?, policy_class: SubcribeCoursePolicy
    if subcribe
      if SubcribeCourse.where(user_id: current_user.id, course_id: @course.id).destroy_all
        flash[:notice] = "Unsubcribe this course success"
      else
        flash[:notice] = "Unsubcribe this course failed"
      end
    else 
      flash[:notice] = "You have not subcribed this course yet"
    end
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :introduction, :price, :status, :content, :photo, :user_id)
    end
end
