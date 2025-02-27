%% Generated by the Erlang ASN.1 compiler. Version: 5.0.21
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition in module AndroidKeyAttestationV3.

-ifndef(_ANDROIDKEYATTESTATIONV3_HRL_).
-define(_ANDROIDKEYATTESTATIONV3_HRL_, true).

-record('AndroidKeyAttestationV3', {
  attestationVersion,
  attestationSecurityLevel,
  keymasterVersion,
  keymasterSecurityLevel,
  attestationChallenge,
  uniqueId,
  softwareEnforced,
  teeEnforced
}).

-record('AuthorizationList', {
  purpose = asn1_NOVALUE,
  algorithm = asn1_NOVALUE,
  keySize = asn1_NOVALUE,
  digest = asn1_NOVALUE,
  padding = asn1_NOVALUE,
  ecCurve = asn1_NOVALUE,
  rsaPublicExponent = asn1_NOVALUE,
  rollbackResistance = asn1_NOVALUE,
  activeDateTime = asn1_NOVALUE,
  originationExpireDateTime = asn1_NOVALUE,
  usageExpireDateTime = asn1_NOVALUE,
  noAuthRequired = asn1_NOVALUE,
  userAuthType = asn1_NOVALUE,
  authTimeout = asn1_NOVALUE,
  allowWhileOnBody = asn1_NOVALUE,
  trustedUserPresenceRequired = asn1_NOVALUE,
  trustedConfirmationRequired = asn1_NOVALUE,
  unlockedDeviceRequired = asn1_NOVALUE,
  allApplications = asn1_NOVALUE,
  applicationId = asn1_NOVALUE,
  creationDateTime = asn1_NOVALUE,
  origin = asn1_NOVALUE,
  rootOfTrust = asn1_NOVALUE,
  osVersion = asn1_NOVALUE,
  osPatchLevel = asn1_NOVALUE,
  attestationApplicationId = asn1_NOVALUE,
  attestationIdBrand = asn1_NOVALUE,
  attestationIdDevice = asn1_NOVALUE,
  attestationIdProduct = asn1_NOVALUE,
  attestationIdSerial = asn1_NOVALUE,
  attestationIdImei = asn1_NOVALUE,
  attestationIdMeid = asn1_NOVALUE,
  attestationIdManufacturer = asn1_NOVALUE,
  attestationIdModel = asn1_NOVALUE,
  vendorPatchLevel = asn1_NOVALUE,
  bootPatchLevel = asn1_NOVALUE
}).

-record('RootOfTrust', {
  verifiedBootKey,
  deviceLocked,
  verifiedBootState,
  verifiedBootHash
}).

-endif. %% _ANDROIDKEYATTESTATIONV3_HRL_
