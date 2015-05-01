public_key_file = File.read(Rails.root.join(".license_encryption_key.pub"))
public_key = OpenSSL::PKey::RSA.new(public_key_file)
Gitlab::License.encryption_key = public_key

# TODO: Validate encryptionkey

# Needed to run migration
if ActiveRecord::Base.connected? && ActiveRecord::Base.connection.table_exists?('licenses')
  message = LicenseHelper.license_message(signed_in: true, is_admin: true)
  if message.present?
    # TODO: Change
    warn "WARNING: #{message}"
  end

  # TODO: Warn about too many users
end
