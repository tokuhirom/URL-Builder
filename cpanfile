requires 'perl', '5.008001';
requires 'WWW::Form::UrlEncoded', '0.14';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Tie::IxHash';
};

