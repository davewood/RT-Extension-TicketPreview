use inc::Module::Install;

RTx     'RT-Extension-TicketPreview';
license 'perl';
repository 'https://github.com/davewood/RT-Extension-TicketPreview';

requires_rt '4.2.0';
rt_too_new '4.6.0';

sign;
WriteAll;
