require 'rdl'
RDL::Config.instance.number_mode = true
require 'types/core'
require 'types/active_record'
require_relative './orig_types.rb'

Rails.application.eager_load! ## load Rails app

puts 'here we are!'


## Methods located in ~/discourse/app/models/user.rb
RDL.infer User, 'self.new_from_params', time: :later
RDL.infer User, 'self.find_by_username', time: :later
RDL.infer User, 'self.username_available?', time: :later # optional arguments
RDL.infer User, :featured_user_badges, time: :later
RDL.infer User, :email_confirmed?, time: :later
RDL.infer User, :activate, time: :later
RDL.infer User, :number_of_deleted_posts, time: :later
RDL.infer User, :number_of_flags_given, time: :later
RDL.infer User, :create_user_profile, time: :later
RDL.infer User, :create_user_option, time: :later
RDL.infer User, :create_email_token, time: :later
RDL.infer User, :seen_before?, time: :later
## Methods located in ~/discourse/app/models/email_token.rb
RDL.infer EmailToken, 'self.active', time: :later
## Methods located in ~/discourse/app/models/post.rb
RDL.infer Post, :seen?, time: :later ## only method called on arg is `id`, name of param is `user` though.
RDL.infer Post, 'self.find_by_detail', time: :later
#RDL.infer Post, :has_active_flag?, time: :later ## doesn't exist in newer discourse version
RDL.infer Post, :is_flagged?, time: :later
RDL.infer Post, :is_reply_by_email?, time: :later
RDL.infer Post, :add_detail, time: :later
RDL.infer Post, :limit_posts_per_day, time: :later
RDL.infer Archetype, 'self.private_message', time: :later
## Methods located in ~/discourse/app/models/group.rb
## the next few have this hash / structural type issue
## also, all of the below get %bot as return type, because we call method on var type at the end.
## not sure about a solution.
RDL.infer Group, :posts_for, time: :later ## Getting %bot for return type. worth taking a second look.
RDL.infer Group, :messages_for, time: :later ## Getting %bot for return type. 
RDL.infer Group, :mentioned_posts_for, time: :later ## Getting %bot for return type.
RDL.infer Group, 'self.trust_group_ids', time: :later
RDL.infer Group, 'self.desired_trust_level_groups', time: :later
RDL.infer Group, 'self.user_trust_level_change!', time: :later
RDL.infer Group, 'self.refresh_automatic_group!', time: :later
RDL.infer Group, 'self.lookup_group', time: :later
## Methods located in ~/discourse/app/models/draft.rb
RDL.infer Draft, 'self.find_draft', time: :later ## got AND here instead of OR because of occurence typing.
## Methods located in ~/discourse/app/models/topic.rb
RDL.infer Topic, :update_action_counts, time: :later
RDL.infer Topic, :has_topic_embed?, time: :later
RDL.infer Topic, :expandable_first_post?, time: :later
## Methods located in ~/discourse/app/models/notification.rb
RDL.infer Notification, 'self.remove_for', time: :later
RDL.infer Notification, :post, time: :later


## NEWLY TYPE CHECKED METHODS/VARS

#RDL.type User, :email, '() -> String', wrap: false
#RDL.infer User, :email, time: :later

#RDL.type User, :email=, '(String) -> String', wrap: false
#RDL.infer User, :email=, time: :later

#RDL.type Badge, 'self.trust_level_badge_ids', '() -> [1,2,3,4]', wrap: false
RDL.infer Badge, 'self.trust_level_badge_ids', time: :later

#RDL.type User, 'self.reserved_username?', "(String) -> %bool", wrap: false
RDL.infer User, 'self.reserved_username?', time: :later

#RDL.type EmailToken, 'self.valid_after', '() -> DateTime', wrap: false
RDL.infer EmailToken, 'self.valid_after', time: :later ## inferred %bot

#RDL.type EmailToken, 'self.confirm', '(String, ?{ skip_reviewable: %bool }) -> %bool', wrap: false
RDL.infer EmailToken, 'self.confirm', time: :later ## inferred %bot for first arg, could be fixed with "swap bounds" rule.

#above method depends on this
#RDL.infer EmailToken, 'self.atomic_confirm', time: :later

#above method relies on this
=begin
RDL.infer EmailToken, 'self.confirmable', time: :later

RDL.infer Invite, 'self.redeem_from_email', time: :later

RDL.infer Email, 'self.downcase', time: :later

RDL.infer Email, 'self.is_valid?', time: :later
=end
#RDL.type PostActionType, 'self.notify_flag_type_ids', '() -> Array<Integer>', wrap: false
RDL.infer PostActionType, 'self.notify_flag_type_ids', time: :later
=begin
RDL.infer PostActionType, 'self.notify_flag_types', time: :later
RDL.infer PostActionType, 'self.flag_settings', time: :later
RDL.infer_var_type PostActionType, :@flag_settings
=end
#RDL.type User, :new_user_posting_on_first_day?, '() -> %bool', wrap: false
RDL.infer User, :new_user_posting_on_first_day?, time: :later
=begin
# above relies on below
RDL.infer User, :first_post_created_at, time: :later
=end

#RDL.type RateLimiter, :initialize, '(User, String, Integer, Integer, ?{global: %bool}) -> self', wrap: false
RDL.infer RateLimiter, :initialize, time: :later
=begin
RDL.infer_var_type RateLimiter, :@user
RDL.infer_var_type RateLimiter, :@type
RDL.infer_var_type RateLimiter, :@key
RDL.infer_var_type RateLimiter, :@max
RDL.infer_var_type RateLimiter, :@secs
RDL.infer_var_type RateLimiter, :@global
=end
#RDL.type Post, 'self.types', '() -> Hash<Symbol, Integer>', wrap: false
#RDL.infer Post, 'self.types', time: :later
#RDL.infer_var_type Post, :@types

#RDL.type UsernameValidator, :initialize, '(String) -> self', wrap: false
RDL.infer UsernameValidator, :initialize, time: :later
=begin
RDL.infer_var_type UsernameValidator, :@username
RDL.infer_var_type UsernameValidator, :@errors
=end

#RDL.type UsernameValidator, :valid_format?, '() -> %bool', wrap: false
RDL.infer UsernameValidator, :valid_format?, time: :later
=begin
RDL.infer UsernameValidator, :username_length_min?, time: :later
RDL.infer UsernameValidator, :username_length_max?, time: :later
RDL.infer UsernameValidator, :username_char_valid?, time: :later
RDL.infer UsernameValidator, :username_char_whitelisted?, time: :later
RDL.infer UsernameValidator, :username_first_char_valid?, time: :later
RDL.infer UsernameValidator, :username_last_char_valid?, time: :later
RDL.infer UsernameValidator, :username_no_double_special?, time: :later
RDL.infer UsernameValidator, :username_does_not_end_with_confusing_suffix?, time: :later
=end
#RDL.type Group, 'self.visibility_levels', '() -> Hash<Symbol, Integer>', wrap: false
#RDL.infer Group, 'self.visibility_levels', time: :later
#RDL.infer_var_type Group, :@visibility_levels
=begin
#RDL.type User, 'self.normalize_username', "(String) -> String", wrap: false
RDL.infer User, 'self.normalize_username', time: :later

#RDL.type User, 'self.username_exists?', "(String) -> %bool", wrap: false
RDL.infer User, 'self.username_exists?', time: :later
=end
#RDL.infer Jobs, 'self.enqueue', time: :later

## Type annotations for variables and unchecked methods are below. The methods are from the Discourse app, or from external libraries.
RDL.type ActiveRecord::Base, 'self.with_deleted', '() -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false
#RDL.type SiteSetting, 'self.max_replies_in_first_day', '() -> Integer'

#RDL.type I18n, 'self.t', '(String, ?{ locale: String }) -> String', wrap: false
#RDL.type Theme, :included_themes, '() -> Array<Theme>', wrap: false
#RDL.type SiteSetting, 'self.embed_truncate?', '() -> %bool', wrap: false
#RDL.type MiniSqlMultisiteConnection, 'exec', "(String) -> %any", wrap: false
RDL.type ActiveRecord::AttributeMethods::ClassMethods, 'attribute_names', '() -> Array<String>', wrap: :false
RDL.type ActiveRecord_Relation, :attribute_names, '() -> Array<String>', wrap: false
RDL.type ActiveRecord_Relation, :active, '() -> self', wrap: false
RDL.type Object, :blank?, '() -> %bool', wrap: false
RDL.type Integer, :day, '() -> ActiveSupport::Duration', wrap: false
RDL.type ActiveSupport::Duration, :to_i, '() -> Integer', wrap: false
RDL.type ActiveRecord::Base, 'self.exec_sql', '(String) -> %bool', wrap: false
RDL.type ActiveRecord::Base, 'self.reset_counters', '(Integer, Symbol) -> Integer', wrap: false
RDL.type String, :unicode_normalize!, "() -> String", wrap: false
#RDL.type SiteSetting, 'self.default_locale', "() -> String", wrap: false

#RDL.type TopicGuardian, :filter_allowed_categories, '(t) -> x', wrap: false #mixin

class GrantedBy
  RDL::Globals.ar_db_schema[:GrantedBy] = RDL::Globals.parser.scan_str "#T GrantedBy<{dummy: Integer}>"
end




RDL.do_infer :later, num_times: 1

