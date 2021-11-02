<?php

namespace App\Repository;

use App\Entity\Music;
use Doctrine\ORM\Query;
use App\Entity\MusicSearch;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method Music|null find($id, $lockMode = null, $lockVersion = null)
 * @method Music|null findOneBy(array $criteria, array $orderBy = null)
 * @method Music[]    findAll()
 * @method Music[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MusicRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Music::class);
    }

    /**
    * @return Query
    */
    public function findAllVisibleQuery(MusicSearch $search)
    {
        $query = $this
            ->createQueryBuilder('m')
            ->select('l','a', 'm')
            ->join('m.album','l')
            ->join('m.artiste','a');

        if ($search->chercheTitre) {
            $query = $query
                ->andWhere('m.titre LIKE :chercheTitre')
                ->setParameter('chercheTitre', '%'.$search->chercheTitre.'%');
        }

        if ($search->chercheAlbum) {
            $query = $query
                ->andWhere('l.nom LIKE :chercheAlbum')
                ->setParameter('chercheAlbum', '%'.$search->chercheAlbum.'%');
        }

        if ($search->chercheArtiste) {
            $query = $query
                ->andWhere('a.nom LIKE :chercheArtiste')
                ->setParameter('chercheArtiste', '%'.$search->chercheArtiste.'%');
        }

        return $query;
    }

}
