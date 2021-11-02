<?php

namespace App\Entity;

use App\Repository\MusicRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MusicRepository::class)
 */
class Music
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $titre;

    /**
     * @ORM\Column(type="integer", options={"default" : 0})
     */
    private $nbreVisionnage;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * 
     */
    private $lienYT;

    /**
     * @ORM\ManyToOne(targetEntity=Album::class, inversedBy="musics")
     */
    private $album;

    /**
     * @ORM\ManyToOne(targetEntity=Artiste::class, inversedBy="musics")
     */
    private $artiste;

    /**
     * @ORM\ManyToOne(targetEntity=Genre::class, inversedBy="musics")
     */
    private $genre;

    /**
     * @ORM\ManyToMany(targetEntity=Utilisateur::class, mappedBy="musics")
     */
    private $utilisateurs;

    public function __construct()
    {
        $this->utilisateurs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getNbreVisionnage(): ?int
    {
        return $this->nbreVisionnage;
    }

    public function setNbreVisionnage(?int $nbreVisionnage): self
    {
        $this->nbreVisionnage = $nbreVisionnage;

        return $this;
    }

    public function getLienYT(): ?string
    {
        return $this->lienYT;
    }

    public function setLienYT(?string $lienYT): self
    {
        $this->lienYT = $lienYT;

        return $this;
    }

    public function getAlbum(): ?Album
    {
        return $this->album;
    }

    public function setAlbum(?Album $album): self
    {
        $this->album = $album;

        return $this;
    }

    public function getArtiste(): ?Artiste
    {
        return $this->artiste;
    }

    public function setArtiste(?Artiste $artiste): self
    {
        $this->artiste = $artiste;

        return $this;
    }

    public function getGenre(): ?Genre
    {
        return $this->genre;
    }

    public function setGenre(?Genre $genre): self
    {
        $this->genre = $genre;

        return $this;
    }

    /**
     * @return Collection|Utilisateur[]
     */
    public function getUtilisateurs(): Collection
    {
        return $this->utilisateurs;
    }

    public function addUtilisateur(Utilisateur $utilisateur): self
    {
        if (!$this->utilisateurs->contains($utilisateur)) {
            $this->utilisateurs[] = $utilisateur;
            $utilisateur->addMusic($this);
        }

        return $this;
    }

    public function removeUtilisateur(Utilisateur $utilisateur): self
    {
        if ($this->utilisateurs->removeElement($utilisateur)) {
            $utilisateur->removeMusic($this);
        }

        return $this;
    }

    public function __toString()
    {
        return $this->titre;
    }
}
