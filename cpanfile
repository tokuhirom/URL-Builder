requires 'perl', '5.008001';
requires 'URL::Encode';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Tie::IxHash';
};

