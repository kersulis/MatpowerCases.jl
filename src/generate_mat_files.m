% MatpowerCases.jl export function
% Jonas Kersulis, 2015-07-15

% Save a .mat file in directory 'd' for each .m file in
% directory 's'. Make sure every .m file in 's' returns a
% caseformat mpc variable!

s = '/home/jkersulis/Documents/MatpowerCases.jl/51casefiles/';
d = '/home/jkersulis/Documents/MatpowerCases.jl/data/';

files = dir([s '*.m']);
for file = files'
  run([s file.name]);
  mpc = ans;
  mpc.docstring = help([s file.name]);
  save([d file.name 'at'],'mpc')
end
