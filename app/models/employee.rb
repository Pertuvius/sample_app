class Employee < ApplicationRecord
  belongs_to :employer
  validates_presence_of :employer
	has_many :timesheets


  def create
  	@Employee = Employee.new(params[:Employee])
  
  	respond_to do |wants|
  		if @Employee.save
  			flash[:notice] = 'Employee was successfully created.'
  			wants.html { redirect_to(@Employee) }
  			wants.xml  { render :xml => @Employee, :status => :created, :location => @Employee }
  		else
  			wants.html { render :action => "new" }
  			wants.xml  { render :xml => @Employee.errors, :status => :unprocessable_entity }
  		end
  	end
  end

private

  def user_params
    params.require(:employer).permit(:create)
  end


end
