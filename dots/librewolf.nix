# Librewolf (Browser) Configuration
{

programs.librewolf = {
	enable = true;
	settings = {
		"webgl.disabled" = false;
		"privacy.resistFingerprinting" = false;
		"privacy.clearOnShutdown.history" = false;
		"privacy.clearOnShutdown.cookies" = false;
		"network.cookie.lifetimePolicy" = 0;
		"identity.fxaccounts.enabled" = true;
		"privacy.trackingprotection.enabled" = true;
		"privacy.trackingprotection.socialtracking.enabled" = true;
		"privacy.trackingprotection.emailtracking.enabled" = true;
    	};
};

}
