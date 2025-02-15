function data = Slice_IMF (this, IMF_number, n_start, n_end)

imf = this.IMFs(IMF_number);

assert(IMF_number <= numel(this.IMFs), 'LwsEMD:OutOfBounds',...
    ['You requested data from an IMF that does not exist.\n' ...
    'details: IMF #%i, n_start = %i, n_end = %i\n'], IMF_number, n_start, n_end);

assert( n_start >= imf.n_earliest, 'LwsEMD:OutOfBounds',...
    ['You requested data that has been pushed out of history.\n' ...
    'details: IMF #%i, n_start = %i, n_end = %i\n'], IMF_number, n_start, n_end);

assert( n_end <= imf.n_latest, 'LwsEMD:OutOfBounds',...
    ['You requested data that has not been calculated yet.\n' ...
    'details: IMF #%i, n_start = %i, n_end = %i\n'], IMF_number, n_start, n_end);

data = imf.GetMode(n_start, n_end);

end