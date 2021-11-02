<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210910134925 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE music DROP FOREIGN KEY FK_CD52224A4BB0713B');
        $this->addSql('CREATE TABLE utilisateur_music (utilisateur_id INT NOT NULL, music_id INT NOT NULL, INDEX IDX_B977A94FB88E14F (utilisateur_id), INDEX IDX_B977A94399BBB13 (music_id), PRIMARY KEY(utilisateur_id, music_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE utilisateur_music ADD CONSTRAINT FK_B977A94FB88E14F FOREIGN KEY (utilisateur_id) REFERENCES utilisateur (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE utilisateur_music ADD CONSTRAINT FK_B977A94399BBB13 FOREIGN KEY (music_id) REFERENCES music (id) ON DELETE CASCADE');
        $this->addSql('DROP TABLE play_list');
        $this->addSql('DROP INDEX IDX_CD52224A4BB0713B ON music');
        $this->addSql('ALTER TABLE music DROP play_list_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE play_list (id INT AUTO_INCREMENT NOT NULL, utilisateur_id INT DEFAULT NULL, UNIQUE INDEX UNIQ_4FCD06C9FB88E14F (utilisateur_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE play_list ADD CONSTRAINT FK_4FCD06C9FB88E14F FOREIGN KEY (utilisateur_id) REFERENCES utilisateur (id)');
        $this->addSql('DROP TABLE utilisateur_music');
        $this->addSql('ALTER TABLE music ADD play_list_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE music ADD CONSTRAINT FK_CD52224A4BB0713B FOREIGN KEY (play_list_id) REFERENCES play_list (id)');
        $this->addSql('CREATE INDEX IDX_CD52224A4BB0713B ON music (play_list_id)');
    }
}
