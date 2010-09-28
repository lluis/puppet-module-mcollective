class McollectiveController < InitrController
  unloadable

  menu_item :initr

  before_filter :find_mcollective
  before_filter :authorize

  def configure
    if request.post?
      params["mcollective"] ||= {}
      if @klass.update_attributes(params["mcollective"])
        flash[:notice]='Configuration saved'
        redirect_to :controller => 'klass', :action => 'list', :id => @node
      else
        render :action=>'configure'
      end
    end
  end

  private

  def find_mcollective
    @klass = Initr::Mcollective.find params[:id]
    @node = @klass.node
    @project = @node.project
  end

end
