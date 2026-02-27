# Git (Version Control Software) Configuration
{

programs.git = {
	enable = true;
	settings = {
      		user = {
        		name  = "Algorithm Rae Parsons";
       			email = "algo@envs.net";
      	};
      		init.defaultBranch = "main";
		safe = {
			directory = [ "/etc/nixos" ];
		};
    	};
};

}
