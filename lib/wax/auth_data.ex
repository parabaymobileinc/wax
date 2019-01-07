defmodule Wax.AuthData do
  @enforce_keys [
    :rp_id_hash,
    :flag_user_present,
    :flag_user_verified,
    :flag_attested_credential_data,
    :flag_extension_data_included,
    :sign_count,
    :attested_credential_data
  ]

  defstruct [
    :rp_id_hash,
    :flag_user_present,
    :flag_user_verified,
    :flag_attested_credential_data,
    :flag_extension_data_included,
    :sign_count,
    :attested_credential_data,
    :extensions
  ]

  @type t :: %__MODULE__{
    rp_id_hash: binary(),
    flag_user_present: boolean(),
    flag_user_verified: boolean(),
    flag_attested_credential_data: boolean(),
    flag_extension_data_included: boolean(),
    sign_count: non_neg_integer(),
    attested_credential_data: Wax.AttestedCredentialData.t(),
    extensions: any() #FIXME
  }

  @type credential_id :: binary()

  def new(rp_id_hash, flag_user_present, flag_user_verified, flag_attested_credential_data,
          flag_extension_data_included, sign_count, attested_credential_data, extensions \\ nil)
  do
    %__MODULE__{
    rp_id_hash: rp_id_hash,
    flag_user_present: flag_user_present,
    flag_user_verified: flag_user_verified,
    flag_attested_credential_data: flag_attested_credential_data,
    flag_extension_data_included: flag_extension_data_included,
    sign_count: sign_count,
    attested_credential_data: attested_credential_data,
    extensions: extensions
    }
  end

  @spec decode(binary()) :: {:ok, t()} | {:error, any()}
  def decode(
    <<
      rp_id_hash::binary-size(32),
      flag_extension_data_included::size(1),
      flag_attested_credential_data::size(1),
      _::size(3),
      flag_user_verified::size(1),
      _::size(1),
      flag_user_present::size(1),
      sign_count::unsigned-big-integer-size(32),
      rest::binary
      >>
  )
  do
    flag_user_present = to_bool(flag_user_present)
    flag_user_verified = to_bool(flag_user_verified)
    flag_attested_credential_data = to_bool(flag_attested_credential_data)
    flag_extension_data_included = to_bool(flag_extension_data_included)

    attested_credential_data =
      if flag_attested_credential_data do
        Wax.AttestedCredentialData.decode!(rest)
      else
        nil
      end

    extensions =
      if flag_extension_data_included do
        nil #FIXME
      else
        nil
      end

    {:ok, %__MODULE__{
        rp_id_hash: rp_id_hash,
        flag_user_present: flag_user_present,
        flag_user_verified: flag_user_verified,
        flag_attested_credential_data: flag_attested_credential_data,
        flag_extension_data_included: flag_extension_data_included,
        sign_count: sign_count,
        attested_credential_data: attested_credential_data,
        extensions: extensions
      }}
  end

  def decode(_), do: {:error, :invalid_auth_data}

  defp to_bool(0), do: false
  defp to_bool(1), do: true
end