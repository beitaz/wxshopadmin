# RailsAdmin.config do |config|

#   # App name
#   config.main_app_name = [ENV['APP_NAME'], ENV['ADMIN_NAME']]
#   # or something more dynamic
#   # config.main_app_name = Proc.new { |controller| [ "Cool app", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }

#   ### Popular gems integration

#   ## == Devise ==
#   config.authenticate_with do
#     warden.authenticate! scope: :user
#   end
#   config.current_user_method(&:current_user)

#   ## == Cancan ==
#   # config.authorize_with :cancan

#   ## == Pundit ==
#   config.authorize_with :pundit

#   ## == PaperTrail ==
#   # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

#   ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

#   ## == Gravatar integration ==
#   ## To disable Gravatar integration in Navigation Bar set to false
#   # config.show_gravatar = true

#   config.actions do
#     dashboard                     # mandatory
#     index                         # mandatory
#     new
#     export
#     bulk_delete
#     show
#     edit
#     delete
#     show_in_app

#     ## With an audit adapter, you can add:
#     # history_index
#     # history_show
#   end

#   wysihtml5_options = {
#     locale: 'zh-CN',
#     #  stylesheets: ['path/to/editor.css'],
#     toolbar: { 'fa': true }, # use font-awesome instead of glyphicon
#     html: true, # enables html editor
#     parserRules: { tags: { p:1 } } # support for <p> in html mode
#   }

#   config.model Good do
#     create do
#       include_all_fields
#       field :detail_info, :wysihtml5 do
#         # (RailsAdmin >= 0.5.0) To configure the editor bar or the parser rules pass a hash of options:
#         config_options wysihtml5_options
#       end
#     end
#     edit do
#       include_all_fields
#       field :detail_info, :wysihtml5 do
#         # (RailsAdmin >= 0.5.0) To configure the editor bar or the parser rules pass a hash of options:
#         config_options wysihtml5_options
#       end
#     end
#   end

#   config.model Photo do
#     create do
#       include_all_fields
#       field :photo, :paperclip
#       field :thum_photo, :paperclip
#     end
#     edit do
#       include_all_fields
#       field :photo, :paperclip
#       field :thum_photo, :paperclip
#     end
#   end

# end

# # module RailsAdmin
# #   module Extensions
# #     module Pundit
# #       class AuthorizationAdapter
# #         def authorize(action, abstract_model = nil, model_object = nil)
# #           record = model_object || abstract_model && abstract_model.model
# #           if action && !policy(record).send(*action_for_pundit(action))
# #             raise ::Pundit::NotAuthorizedError.new("not allowed to #{action} this #{record}")
# #           end
# #           @controller.instance_variable_set(:@_pundit_policy_authorized, true)
# #         end

# #         def authorized?(action, abstract_model = nil, model_object = nil)
# #           record = model_object || abstract_model && abstract_model.model
# #           policy(record).send(*action_for_pundit(action)) if action
# #         end

# #         def action_for_pundit(action)
# #           [:rails_admin?, action]
# #         end
# #       end
# #     end
# #   end
# # end