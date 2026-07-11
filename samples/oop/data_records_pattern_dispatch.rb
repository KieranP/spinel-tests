# frozen_string_literal: true
# Data records in containers + pattern match dispatch
Event = Data.define(:kind, :payload)
User = Data.define(:id, :name, :roles)

def handle(event)
  case event
  in Event[kind: :login, payload: { user: User[name:, roles:] }]
    "#{name} logged in with #{roles.join(',')}"
  in Event[kind: :logout, payload: { id: }]
    "user #{id} logged out"
  in Event[kind: :error, payload: String => msg]
    "error: #{msg}"
  end
end

alice = User.new(1, "Alice", [:admin, :user])
events = [
  Event.new(:login, { user: alice }),
  Event.new(:logout, { id: 1 }),
  Event.new(:error, "disk full")
]
events.each { |e| puts handle(e) }

by_kind = events.group_by(&:kind)
p by_kind.keys
p alice.roles.include?(:admin)
p User.members
seen = {}
seen[alice] = 42
p seen[User.new(1, "Alice", [:admin, :user])]
p alice.instance_of?(User)
p events.first.payload[:user].name
