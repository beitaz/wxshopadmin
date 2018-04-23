module RailsAdmin
  module Extensions
    module Pundit
      class AuthorizationAdapter
        def authorize(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model && abstract_model.model
          if action && !policy(record).send(*action_for_pundit(action))
            raise ::Pundit::NotAuthorizedError.new("not allowed to #{action} this #{record}")
          end
          @controller.instance_variable_set(:@_pundit_policy_authorized, true)
        end

        def authorized?(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model && abstract_model.model
          policy(record).send(*action_for_pundit(action)) if action
        end

        def action_for_pundit(action)
          [:rails_admin?, action]
        end
      end
    end
  end
end